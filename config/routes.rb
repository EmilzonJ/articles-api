# frozen_string_literal: true

Rails.application.routes.draw do
  mount Motor::Admin => '/admin'
  draw :api
end
