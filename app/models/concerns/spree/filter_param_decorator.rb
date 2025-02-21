module Spree
  module FilterParamDecorator
    def set_filter_param
      return if param_candidate.blank?

      self.filter_param = param_candidate
    end

  end
end
Spree::FilterParam.prepend Spree::FilterParamDecorator
