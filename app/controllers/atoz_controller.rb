class AtozController < ApplicationController

  def render_response(type = "error", options = {})
    render json: construct_response(type, options)
  end

  def construct_response(type, options = {})
    options            = {}  if !options.class.eql?(Hash)
    options[:code]     = 200 if options[:code].blank?
    options[:messages] = []  if options[:messages].blank?
    options[:data]     = {}  if options[:data].blank?
    options[:meta]     = {}  if options[:meta].blank?
    options[:return]   = {}

    options[:meta].merge!({
      code: options[:code]
    }) if type.eql?("error")

    options[:meta].merge!({
      code: options[:code]
    }) if !type.eql?("error")

    return options[:return].merge!({
      meta: options[:meta].merge!({
        messages: options[:messages]
      }),
      data: options[:data]
    })
  end

end
