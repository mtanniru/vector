package metadata

components: transforms: add_tags: {
  title: "Add Tags"
  short_description: "Accepts metric events and allows you to add one or more metric tags."
  long_description: "Accepts metric events and allows you to add one or more metric tags."

  classes: {
    commonly_used: false
    function: "schema"
  }

  features: {
    tls: enabled: false
  }

  statuses: {
    development: "stable"
  }

  support: {
    input_types: ["metric"]

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
    overwrite: {
      common: true
      description: "By default, fields will be overridden. Set this to `false` to avoid overwriting values.\n"
      required: false
      warnings: []
      type: bool: default: true
    }
    tags: {
      common: true
      description: "A table of key/value pairs representing the tags to be added to the metric."
      required: false
      warnings: []
      type: object: {
        examples: [{"static_tag":"my value"},{"env_tag":"${ENV_VAR}"}]
        options: {}
      }
    }
  }
}