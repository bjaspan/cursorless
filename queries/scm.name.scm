;;!! (aaa) @bbb @ccc
;;!        ^^^^^^^^^
;;!  ---------------
(
  (_
    _ @dummy
    .
    (capture) @name.start
    (capture)? @name.end
    .
  ) @_.domain
  (#not-type? @_.domain parameters)
  (#not-type? @dummy capture)
  (#not-parent-type? @_.domain field_definition)
)

;;!! eee: (aaa) @bbb @ccc
;;!             ^^^^^^^^^
;;!  --------------------
(
  (field_definition
    (_
      _ @dummy
      .
      (capture) @name.start
      (capture)? @name.end
      .
    )
  ) @_.domain
  (#not-type? @dummy capture)
)

;;!! (aaa) @bbb @ccc
;;!        ^^^^ ^^^^
(
  (_
    (capture) @name
  ) @dummy
  (#not-type? @dummy parameters)
  (#has-multiple-children-of-type? @dummy capture)
)

;;!! (aaa) @bbb @ccc
;;!        *********
;;!  --------------- <~ iteration domain
(
  (_
    _ @dummy
    .
    (capture) @name.iteration.start
  ) @name.iteration.end.endOf @name.iteration.domain
  (#not-type? @dummy capture)
  (#not-type? @name.iteration.start parameters)
  (#not-parent-type? @name.iteration.domain field_definition)
)

;;!! ddd: (aaa) @bbb @ccc
;;!             *********
;;!  -------------------- <~ iteration domain
(
  (field_definition
    [
      ;; Note that we can't use wildcard node due to
      ;; https://github.com/tree-sitter/tree-sitter/issues/2483
      (named_node
        _ @dummy
        .
        (capture) @name.iteration.start
      )
      (anonymous_node
        _ @dummy
        .
        (capture) @name.iteration.start
      )
      (list
        _ @dummy
        .
        (capture) @name.iteration.start
      )
    ]
  ) @name.iteration.end.endOf @name.iteration.domain
  (#not-type? @dummy capture)
)
