class Device < ApplicationRecord
  has_many :tickets
  belongs_to :model
  # belongs_to :brand
  # belongs_to :category
  validates :imei, format: { with: /\A[0-9]{15}\Z/,
      message: "IMEI must contain 15 digits" }, allow_blank: true

      def self.array_with_text
        t = []
        Device.all.select {|dev| t << [[dev.model.description, dev.imei.to_s].join(" imei: "), dev.id.to_s ] }
        return t
      end
end
