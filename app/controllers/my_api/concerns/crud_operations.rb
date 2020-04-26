module CRUDOperations
  def self.included(base)
    base.before_action :set_resource, except: :index
  end

  def index
    resources = resource_class.all

    instance_variable_set "@#{controller_name}", resources

    json_response(resources)
  end

  def show
    json_response(@resource)
  end

  def update
    @resource.update(update_params)

    head :no_content
  end

  def create
    @resource.save!

    json_response(@resource, :created)
  end

  def destroy
    @resource.destroy

    head :no_content
  end

  private

  def resource_class
    "MyApi::#{controller_name.singularize.classify}".constantize
  end

  def set_resource
    instance_variable_set "@#{controller_name.singularize}", resource
  end

  def resource
    @resource ||= if params[:id]
      resource_class.find(params[:id])
    elsif action_name == 'create'
      resource_class.new create_params
    else
      resource_class.new
    end
  end

  def create_params
    permittd_params
  end

  def update_params
    permittd_params
  end

  def permittd_params
    params.require(controller_name.singularize).permit!
  end
end
