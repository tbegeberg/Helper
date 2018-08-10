import Vapor
import Authentication

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
    let helpController = HelpingController()
    let tokenAuthenticationMiddleware = User.tokenAuthMiddleware()
    let guardAuthentication = User.guardAuthMiddleware()
    let authedRoutes = router.grouped([tokenAuthenticationMiddleware, guardAuthentication])
    authedRoutes.get("getAssignment", use: assignmentController.index)
    
   
}
