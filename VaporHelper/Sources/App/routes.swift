import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    let userController = UserController()
    router.post("createUser", use: userController.create)
    router.post("loginUser", use: userController.loginUser)
  
    
    let assignmentController = AssignmentController()
    router.get("getAssignment", use: assignmentController.index)
    router.post("postAssignment", use: assignmentController.create)
    router.patch("patchAssignment", use: assignmentController.patch)
    router.delete("deleteAssignment", use: assignmentController.delete)
    
    let helpController = HelpingController()
    router.get("getHelping", use: helpController.index)
    router.post("postHelping", use: helpController.create)
    router.patch("patchHelping", use: helpController.patch)
    router.delete("deleteHelping", use: helpController.delete)
    
    let tokenAuthenticationMiddleware = User.tokenAuthMiddleware()
    let authedRoutes = router.grouped(tokenAuthenticationMiddleware)
    authedRoutes.get("this/protected/route") { request -> Future<User.PublicUser> in
        let user = try request.requireAuthenticated(User.self)
        return try user.authTokens.query(on: request).first().map(to: User.PublicUser.self) { userTokenType in // 4
            guard let tokenType = userTokenType?.token else { throw Abort.init(HTTPResponseStatus.notFound) }
            return User.PublicUser(username: user.username, token: tokenType)
        }
    }
}
