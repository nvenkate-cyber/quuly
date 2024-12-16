let hello_world = Bonsai.const (
  Vdom.Node.div ~attr:(Vdom.Attr.class "my-class") [
    Vdom.Node.p [ Vdom.Node.text "hello world" ];
    Vdom.Node.span [ Vdom.Node.text "this is Bonsai" ];
])

let root_component = Bonsai.const (Vdom.Node.text "hello world")

let (_ : _ Start.Handle.t) =
  Start.start Start.Result_spec.just_the_view ~bind_to_element_with_id:"app" root_component