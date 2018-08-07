import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    let userController = UserController()
    router.get("getUser", use: userController.index)
    router.post("postUser", use: userController.create)
    router.patch("patchUser", use: userController.patch)
    router.delete("deleteUser", User.parameter, use: userController.delete)
    
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
}
