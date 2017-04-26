import Vapor
import HTTP

/// Customized error type.
public struct AbortExtended: AbortError {
    public let status: Status
    public let code: Int
    public let metadata: Node?
    public let reason: String

    /// Creates a customized error with the given values.
    ///
    /// - Parameters:
    ///   - status: The HTTP status code to return. 
    ///     Defaults to `Status.internalServerError`.
    ///   - code: An integer representation of the error. 
    ///     Defaults to 0.
    ///   - message: Textual representation on the error. 
    ///     Defaults to `Status.internalServerError.reasonPhrase`.
    ///   - metadata: Custom metadata. Defaults to `nil`.
    ///   - report: Indicates if middleware(s) should report this error. 
    ///     Defaults to `true`.
    ///     This will set `metadata["report"]`.
    /// - Returns: Customized error (conforming to `AbortError`).
    public static func custom(
        status: Status = .internalServerError,
        code: Int = 0,
        metadata: Node? = nil,
        reason: String = Status.internalServerError.reasonPhrase,
        report: Bool = true
    ) -> AbortExtended {
        return AbortExtended(
            status: status,
            code: code,
            metadata: AbortExtended.resolveMetadata(metadata, report: report),
            reason: reason
        )
    }

    /// Helper to resolve metadata.
    ///
    /// - Parameters:
    ///   - metadata: The current metadata.
    ///   - report: Indicates if middleware(s) should report this error.
    /// - Returns: Resolved metadata.
    private static func resolveMetadata(_ metadata: Node?, report: Bool) -> Node {
        var metadata = metadata ?? Node([:])
        metadata["report"] = Node(report)
        return metadata
    }
}
