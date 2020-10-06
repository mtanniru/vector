package metadata

components: transforms: ansi_stripper: {
  title: "ANSI Stripper"
  short_description: "Accepts log events and allows you to strips ANSI escape sequences from the specified field."
  long_description: "Accepts log events and allows you to strips ANSI escape sequences from the specified field."

  classes: {
    commonly_used: false
    function: "sanitize"
  }

  features: {
    tls: enabled: false
  }

  statuses: {
    development: "stable"
  }

  support: {
    input_types: ["log"]

    platforms: {
      "aarch64-unknown-linux-gnu": true
      "aarch64-unknown-linux-musl": true
      "x86_64-apple-darwin": true
      "x86_64-pc-windows-msv": true
      "x86_64-unknown-linux-gnu": true
      "x86_64-unknown-linux-musl": true
    }

    requirements: []
    warnings: []
  }

  configuration: {
    field: {
      common: true
      description: "The target field to strip ANSI escape sequences from."
      required: false
      warnings: []
      type: string: {
        default: "message"
        examples: ["message","parent.child","array[0]"]
      }
    }
  }
}
