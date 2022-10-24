# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
 respond_to :json

 def respond_with(resource, options={})
   if resource.persisted?
      render json: {
        status: {code: 200, message: "Sign up successful", data: resource}
      } else
       render json: {
        message: "Person couldn't be created", error: resource.errors.full_message
       }, status: unprocessable_entity
   end
 end

end
