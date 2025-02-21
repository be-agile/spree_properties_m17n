module Spree
  module Products
    module FindDecorator
      def by_properties(products)
        return products unless properties?

        product_ids = []
        index = 0

        properties.to_unsafe_hash.each do |property_filter_param, product_properties_values|
          next if property_filter_param.blank? || product_properties_values.empty?

          values = product_properties_values.split(',').reject(&:empty?).uniq

          next if values.empty?

          ids = scope.unscope(:order, :includes)
                    .joins(product_properties: :property)
                    .where(Property.table_name => { filter_param: property_filter_param })
                    .where(ProductProperty.table_name => { filter_param: values })
                    .ids
          product_ids = index == 0 ? ids : product_ids & ids
          index += 1
        end

        products.where(id: product_ids)
      end
    end
  end
end

Spree::Products::Find.prepend Spree::Products::FindDecorator
