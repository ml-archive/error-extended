import Vapor
import HTTP

public enum AbortExtended {
    case badRequest(metadata: Node)
    case notFound(metadata: Node)
    case serverError(metadata: Node)
    case custom(status: Status, message: String, metadata: Node)
}

extension AbortExtended: AbortError {
    public var message: String {
        switch self {
        case .badRequest:
            return Abort.badRequest.message
        case .notFound:
            return Abort.notFound.message
        case .serverError:
            return Abort.serverError.message
        case .custom(status: _, message: let message, metadata: _):
            return message
        }
    }
    
    public var code: Int {
        switch self {
        case .badRequest:
            return Abort.badRequest.code
        case .notFound:
            return Abort.notFound.code
        case .serverError:
            return Abort.serverError.code
        case .custom(status: let status, message: _, metadata: _):
            return status.statusCode
        }
    }
    
    public var status: Status {
        switch self {
        case .badRequest:
            return Abort.badRequest.status
        case .notFound:
            return Abort.notFound.status
        case .serverError:
            return Abort.serverError.status
        case .custom(status: let status, message: _, metadata: _):
            return status
        }
    }
    
    public var metadata: Node? {
        switch self {
        case .badRequest(let metadata):
            return metadata
        case .notFound(let metadata):
            return metadata
        case .serverError(let metadata):
            return metadata
        case .custom(status: _, message: _, metadata: let metadata):
            return metadata
        }
    }
}
