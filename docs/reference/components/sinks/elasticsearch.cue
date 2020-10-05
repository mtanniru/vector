package metadata

components: sinks: elasticsearch: {
  title: "Elasticsearch"
  short_description: "Batches log events to [Elasticsearch][urls.elasticsearch] via the [`_bulk` API endpoint][urls.elasticsearch_bulk]."
  long_description: "[Elasticsearch][urls.elasticsearch] is a search engine based on the Lucene library. It provides a distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents. As a result, it is very commonly used to store and analyze log data. It ships with Kibana which is a simple interface for visualizing and exploring data in Elasticsearch."

  _features: {
    batch: {
      enabled: true
      common: false,
      max_bytes: 10490000,
      max_events: null,
      timeout_secs: 1
    }
    buffer: enabled: true
    checkpoint: enabled: false
    compression: {
      enabled: true
      default: "none"
      gzip: true
    }
    encoding: {
      enabled: true
      default: null
      json: null
      ndjson: null
      text: null
    }
    healthcheck: enabled: true
    multiline: enabled: false
    request: {
      enabled: true
      common: false,
      in_flight_limit: 5,
      rate_limit_duration_secs: 1,
      rate_limit_num: 5,
      retry_initial_backoff_secs: 1,
      retry_max_duration_secs: 10,
      timeout_secs: 60
    }
    tls: {
      enabled: true
      can_enable: false
      can_verify_certificate: true
      can_verify_hostname: true
      enabled_default: false
    }
  }

  classes: {
    commonly_used: true
    function: "transmit"
    service_providers: ["AWS","Azure","Elastic","GCP"]
  }

  statuses: {
    delivery: "at_least_once"
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
    auth: {
      common: false
      description: "Options for the authentication strategy."
      required: false
      warnings: []
      type: object: {
        examples: []
        options: {
          assume_role: {
            common: false
            description: "The ARN of an [IAM role][urls.aws_iam_role] to assume at startup."
            required: false
            warnings: []
            type: string: {
              default: null
              examples: ["arn:aws:iam::123456789098:role/my_role"]
            }
          }
          password: {
            description: "The basic authentication password."
            required: true
            warnings: []
            type: string: {
              examples: ["${ELASTICSEARCH_PASSWORD}","password"]
            }
          }
          strategy: {
            description: "The authentication strategy to use."
            required: true
            warnings: []
            type: string: {
              enum: {
                aws: "Authentication strategy used for [AWS' hosted Elasticsearch service][urls.aws_elasticsearch]."
                basic: "The [basic authentication strategy][urls.basic_auth]."
              }
            }
          }
          user: {
            description: "The basic authentication user name."
            required: true
            warnings: []
            type: string: {
              examples: ["${ELASTICSEARCH_USERNAME}","username"]
            }
          }
        }
      }
    }
    aws: {
      common: false
      description: "Options for the AWS connections."
      required: false
      warnings: []
      type: object: {
        examples: []
        options: {
          region: {
            common: true
            description: "The [AWS region][urls.aws_regions] of the target service. This defaults to the region named in the endpoint parameter, or the value of the `$AWS_REGION` or `$AWS_DEFAULT_REGION` environment variables if that cannot be determined, or \"us-east-1\"."
            required: false
            warnings: []
            type: string: {
              default: null
              examples: ["us-east-1"]
            }
          }
        }
      }
    }
    doc_type: {
      common: false
      description: "The `doc_type` for your index data. This is only relevant for Elasticsearch <= 6.X. If you are using >= 7.0 you do not need to set this option since Elasticsearch has removed it."
      required: false
      warnings: []
      type: string: {
        default: "_doc"
      }
    }
    headers: {
      common: false
      description: "Options for custom headers."
      required: false
      warnings: []
      type: object: {
        examples: [{"Authorization":"${ELASTICSEARCH_TOKEN}"},{"X-Powered-By":"Vector"}]
        options: {}
      }
    }
    id_key: {
      common: false
      description: "The name of the event key that should map to Elasticsearch's [`_id` field][urls.elasticsearch_id_field]. By default, Vector does not set the `_id` field, which allows Elasticsearch to set this automatically. You should think carefully about setting your own Elasticsearch IDs, since this can [hinder perofrmance][urls.elasticsearch_id_performance]."
      required: false
      warnings: []
      type: string: {
        default: null
        examples: ["id","_id"]
      }
    }
    index: {
      common: true
      description: "Index name to write events to."
      required: false
      warnings: []
      type: string: {
        default: "vector-%F"
        examples: ["application-{{ application_id }}-%Y-%m-%d","vector-%Y-%m-%d"]
      }
    }
    pipeline: {
      common: true
      description: "Name of the pipeline to apply."
      required: false
      warnings: []
      type: string: {
        default: null
        examples: ["pipeline-name"]
      }
    }
    query: {
      common: false
      description: "Custom parameters to Elasticsearch query string."
      required: false
      warnings: []
      type: object: {
        examples: [{"X-Powered-By":"Vector"}]
        options: {}
      }
    }
  }
}

