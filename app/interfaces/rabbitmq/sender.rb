# frozen_string_literal: true

module Integrations
  module Rabbitmq
    class BillCanceledService < Integrations::Edi::Base
      def initialize(bill)
        @bill = bill
        @payee = @bill.fornecedor
        payer = @bill.sacado
        super(
          {
            exchange_name: 'liber.input',
            routing_key: 'invoice.canceled',
            headers: {
              exchange: 'output',
              routing_key: payer.edi_sacado_output_key
            }
          }
        )
      end

      def call
        data = {
          payee: {
            id_type: 'CNPJ',
            id: payee.cnpj,
            name: payee.trade_name
          },
          payer_doc_id: bill.reference_erp,
          ref_number_edi: bill.reference_number_edi,
          ref_number: bill.reference_number
        }

        direct_publish([data])
      rescue StandardError => e
        OpenStruct.new(success?: false, message: e)
      end

      private

      attr_reader :bill, :payee
    end
  end
end
