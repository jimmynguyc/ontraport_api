module OntraportApi
  module APIs
    module Transactions
      TRANSACTIONS_API_METHODS_AND_PATHS = {
        'new_transaction'                     => [:post, '/transaction/processManual'],
        'refund_transactions'                 => [:put,  '/transaction/refund'],
        'convert_transactions_to_decline'     => [:put,  '/transaction/convertToDecline'],
        'convert_transactions_to_collections' => [:put,  '/transaction/convertToCollections'],
        'void_transaction'                    => [:put,  '/transaction/void'],
        'void_purchase'                       => [:put,  '/transaction/voidPurchase'],
        'rerun_commission'                    => [:put,  '/transaction/rerunCommission'],
        'mark_paid'                           => [:put,  '/transaction/markPaid'],
        'rerun_transaction'                   => [:post, '/transaction/rerun'],
        'write_off_transaction'               => [:put,  '/transaction/writeOff'],
        'get_order'                           => [:get,  '/transaction/order'],
        'update_order'                        => [:put,  '/transaction/order'],
        'resend_invoice'                      => [:post, '/transaction/resendInvoice']
      }

      def new_transaction(transaction = {})
        query_transactions(transaction)
      end

      def refund_transactions(criteria = {})
        query_transactions(criteria)
      end

      def convert_transactions_to_decline(id)
        query_transactions({ id: id })
      end

      def convert_transactions_to_collections(id)
        query_transactions({ id: id })
      end

      def void_transaction(criteria = {})
        query_transactions(criteria)
      end

      def void_purchase(id)
        query_transactions({ id: id })
      end

      def rerun_commission(criteria = {})
        query_transactions(criteria)
      end

      def mark_paid(id)
        query_transactions({ id: id })
      end

      def rerun_transaction(criteria = {})
        query_transactions(criteria)
      end

      def write_off_transaction(id)
        query_transactions({ id: id })
      end

      def get_order(id)
        query_transactions({ id: id })
      end

      def update_order(payload = {})
        query_transactions(payload)
      end

      def resend_invoice(payload = {})
        query_transactions(payload)
      end

      def query_transactions(payload)
        method, path = TRANSACTIONS_API_METHODS_AND_PATHS[caller[0][/`.*'/][1..-2]]
        query(method, path, payload)
      end
    end
  end
end
