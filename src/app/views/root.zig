// بسم الله الرحمن الرحيم
// la ilaha illa Allah Mohammed rassoul Allah
const std = @import("std");
const jetzig = @import("jetzig");

pub const layout = "main";

/// `src/app/views/root.zig` represents the root URL `/`
/// The `index` view function is invoked when when the HTTP verb is `GET`.
/// Other view types are invoked either by passing a resource ID value (e.g. `/1234`) or by using
/// a different HTTP verb:
///
/// GET / => index(request, data)
/// GET /1234 => get(id, request, data)
/// POST / => post(request, data)
/// PUT /1234 => put(id, request, data)
/// PATCH /1234 => patch(id, request, data)
/// DELETE /1234 => delete(id, request, data)
pub fn index(request: *jetzig.Request, data: *jetzig.Data) !jetzig.View {
    var root = try data.object();

    try root.put("welcome_message", data.string("Welcome to Jetzig!"));

    // const params = try request.params();

    // try root.put("message_param", params.get("message"));

    // Set arbitrary response headers as required. `content-type` is automatically assigned for
    // HTML, JSON responses.
    //
    // Static files located in `public/` in the root of your project directory are accessible
    // from the root path (e.g. `public/jetzig.png`) is available at `/jetzig.png` and the
    // content type is inferred from the extension using MIME types.
    // try request.response.headers.append("x-example-header", "example header value");

    // Render the response and set the response code.
    return request.render(.ok);
}
