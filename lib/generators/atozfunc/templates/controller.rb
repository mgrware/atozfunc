class <%= controller_class_name %>Controller < Atozfunc::AtozController

  def index
    @<%=plural_name %> = <%= singular_name.camelize %>.all
    if @<%= plural_name %>.present?
      render_response("success", { messages: ['success'], code: 200, data: @<%= plural_name %> })
    else
      render_response("warning", { messages: ['data not available'], code: 402, data: @<%= plural_name %> })
    end
  end

  def show
    @<%=singular_name %> = <%= singular_name.camelize %>.find(params[:id])
    if @<%= plural_name %>.present?
      render_response("success", { messages: ['success'], code: 200, data: @<%= singular_name %> })
    else
      render_response("warning", { messages: ['data not available'], code: 402, data: @<%= singular_name %> })
    end
  end

  def new
    @<%=singular_name %> = <%= singular_name.camelize %>.new
    render_response("success", { messages: ['success'], code: 200, data: @<%= singular_name %> })
  end

  def create
    @<%=singular_name %> = <%= singular_name.camelize %>.new(<%= singular_name %>_params)
    if @<%= plural_name %>.save
      render_response("success", { messages: ['success'], code: 200, data: @<%= singular_name %> })
    else
      render_response("warning", { messages: @<%=singular_name %>.errors.full_messages, code: 402, data: @<%= singular_name %> })
    end
  end

  def edit
    @<%=singular_name %> = <%= singular_name.camelize %>.find(params[:id])
    if @<%= plural_name %>.present?
      render_response("success", { messages: ['success'], code: 200, data: @<%= singular_name %> })
    else
      render_response("warning", { messages: ['data not available'], code: 402, data: @<%= singular_name %> })
    end
  end

  def update
    @<%=singular_name %> = <%= singular_name.camelize %>.update(<%= singular_name %>_params)
    if  @<%=singular_name %>.errors.blank?
      render_response("success", { messages: ['success'], code: 200, data: @<%= singular_name %> })
    else
      render_response("warning", { messages: @<%=singular_name %>.errors.full_messages, code: 402, data: @<%= singular_name %> })
    end
  end

  def destroy
    @<%=singular_name %> = <%= singular_name.camelize %>.find(params[:id])
    if  @<%=singular_name %>.destroy
      render_response("success", { messages: ['success'], code: 200, data: @<%= singular_name %> })
    else
      render_response("warning", { messages: @<%=singular_name %>.errors.full_messages, code: 402, data: @<%= singular_name %> })
    end
  end

  private

  def <%= singular_name %>_params
    params.require(:<%= singular_name %>).permit(<%= editable_attributes %>)
  end
end
