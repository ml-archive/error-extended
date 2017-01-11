import Vapor
import HTTP

/// Customized error type.
public struct AbortExtended: AbortError {
    public let message: String
    public let code: Int
    public let status: Status
    public let metadata: Node?

    /// Creates a customized error with the given values.
    ///
    /// - Parameters:
    ///   - status: The HTTP status code to return. 
    ///     Defaults to `Status.internalServerError`.
    ///   - code: An integer representation of the error. 
    ///     Defaults to `Status.internalServerError.statusCode`.
    ///   - message: Textual representation on the error. 
    ///     Defaults to `Status.internalServerError.reasonPhrase`.
    ///   - metadata: Custom metadata. Defaults to `nil`.
    ///   - report: Indicates if middleware(s) should report this error. 
    ///     Defaults to `true`.
    ///     This will set `metadata["report"]`.
    /// - Returns: Customized error (conforming to `AbortError`).
    public static func custom(
        status: Status = .internalServerError,
        code: Int = Status.internalServerError.statusCode,
        message: String = Status.internalServerError.reasonPhrase,
        metadata: Node? = nil,
        report: Bool = true
    ) -> AbortExtended {
        return AbortExtended(
            message: message,
            code: code,
            status: status,
            metadata: AbortExtended.resolveMetadata(metadata, report: report)
        )
    }

    /// Helper to resolve metadata.
    ///
    /// - Parameters:
    ///   - metadata: The current metadata.
    ///   - report: Indicates if middleware(s) should report this error.
    /// - Returns: Resolved metadata.
    private static func resolveMetadata(_ metadata: Node?, report: Bool) -> Node? {
        var metadata = metadata ?? Node([:])
        metadata["report"] = Node(report)
        return metadata
    }
}

func foo() throws {
throw AbortExtended.custom(code: 1337)
throw AbortExtended.custom(status: .badRequest, code: 1337, message: "Sorry, bad request", report: false)
throw AbortExtended.custom(status: .badGateway, code: Status.badGateway.statusCode, message: Status.badGateway.reasonPhrase, metadata: Node(["key": "value"]), report: false)
}
