import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    let profileController = ProfileController()
    router.get("getProfile", use: profileController.index)
    router.post("postProfile", use: profileController.create)
    router.patch("patchProfile", use: profileController.patch)
    router.delete("deleteProfile", Profile.parameter, use: profileController.delete)
    
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
