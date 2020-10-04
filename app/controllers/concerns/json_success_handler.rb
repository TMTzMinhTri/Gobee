module JsonSuccessHandler

  ### Manually render success with data, status and status code
  def assign_success(data = {}, status = nil, status_code = nil)
    status ||= 200
    status_code ||= "OK"
    render status: status, json: {
      status: status,
      code: status_code,
      data: data
    }
  end


  ### Render success with serialized model
  def success(resource, summary = {})
    response = {}
    response[:status] ||= 200
    if resource.respond_to? :serializable_hash
      data = resource.serializable_hash[:data]
      if data.is_a?(Array)
        data = data.map{|d| d[:attributes]}
      else
        data = resource.serializable_hash[:data][:attributes]
      end
    else
      data = resource
    end

    response[:json] ||= {
      status: response[:status],
      code: "OK",
      data: data
    }

    if summary.present?
      response[:json][:summary] = summary
    end

    render(response)
  end
end
