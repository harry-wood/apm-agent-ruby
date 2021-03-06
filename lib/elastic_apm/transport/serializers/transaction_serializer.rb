# frozen_string_literal: true

module ElasticAPM
  module Transport
    module Serializers
      # @api private
      class TransactionSerializer < Serializer
        # rubocop:disable Metrics/MethodLength
        def build(transaction)
          {
            transaction: {
              id: transaction.id,
              trace_id: transaction.trace_id,
              parent_id: transaction.parent_id,
              name: transaction.name,
              type: transaction.type,
              result: transaction.result.to_s,
              duration: ms(transaction.duration),
              timestamp: transaction.timestamp,
              sampled: transaction.sampled?,
              context: transaction.context.to_h,
              span_count: {
                started: transaction.started_spans,
                dropped: transaction.dropped_spans
              }
            }
          }
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
