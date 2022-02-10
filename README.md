# Rails Directory Structure Guide

There is a default directory structure that __Ruby on Rails__ comes with. The Rails guides go in depth in explaining the folder structure, but does not talk about the extra folders that commonly get added in Rails Apps.

> A key, longstanding hallmark of a good program is that it
> separates what is stable from what changes in the interest of good maintenance.
> Trygve Reenskaug

## Directory Structure

- [.github](#github)
- [app](#app)
  - [assets](#app_assets)
  - [channels](#app_channels)
  - [controllers](#app_controllers)
  - [helpers](#app_helpers)
  - [javascript](#app_javascript)
  - [interfaces](#app_interfaces)
  - [mailers](#appmailers)
  - [models](#app_models)
  - [policies](#app_policies)
  - [presenters](#app_presenters)
  - [repositories](#app_repositories)
  - [schemas](#app_schemas)
  - [services](#app_services)
  - [strategies](#app_strategies)
  - [uploaders](#app_uploaders)
  - [use_cases](#app_use_cases)
  - [values](#app_values)
  - [validators](#app_values)
  - [views](#app_views)
  - [workers](#app_workers)
- [bin](#bin)
- [certs](#certs)
- [config](#config)
  - [environments](#config_environments)
  - [initializers](#config_initializers)
  - [locales](#config_locales)
- [db](#db)
  - [migrate](#db_migrate)
- [docs](#docs)
- [lib](#lib)
  - [core_ext](#lib_core_ext)
  - [tasks](#lib_tasks)
- [log](#log)
- [public](#public)
- [spec](#spec)
  - [integration](#spec_integration)
    - [factories](#spec_factories)
    - [helpers](#spec_helpers)
    - [mailers](#spec_mailers)
    - [models](#spec_models)
    - [requests](#spec_requests)
    - [routing](#spec_routing)
    - [support](#spec_support)
    - [views](#spec_views)
  - [unit](#spec_unit)
    - [factories](#spec_factories)
    - [helpers](#spec_helpers)
    - [mailers](#spec_mailers)
    - [models](#spec_models)
    - [requests](#spec_requests)
    - [routing](#spec_routing)
    - [support](#spec_support)
    - [views](#spec_views)
- [swagger](#swagger)
  - [v1](#swagger_v1)
- [tmp](#tmp)
- [vendor](#vendor)
  - [assets](#vendor_assets)
    - [javascripts](#vendor_assets_javascripts)
    - [stylesheets](#vendor_assets_stylesheets)

---

### app

Ele organiza os componentes da aplicação. Tem subdiretórios que contêm as views, controllers, models e outros que lidam com a lógica de negócios.

### app/assets

Contém os assets da aplicação, incluindo imagens, stylesheets e javascript.

### app/channels

Contém canais usados para configurar conexões com [ActionCable](http://guides.rubyonrails.org/action_cable_overview.html#channels).

### app/controllers

Contém app [controllers](http://guides.rubyonrails.org/action_controller_overview.html).

### app/helpers

Contém app [helpers](http://guides.rubyonrails.org/action_view_overview.html#overview-of-helpers-provided-by-action-view).

### app/mailers

Contém app [mailers](http://guides.rubyonrails.org/action_mailer_basics.html).

### app/models

Contém app [models](http://guides.rubyonrails.org/active_record_basics.html).

### *app/policies

Policies são simples objetos Ruby antigos que lidam com a lógica de apresentação.

### *app/presenters

Presenters são usados pelas controllers para montar o objeto final retornado pela aplicação.

### *app/services

Contains app services. A service object implements the user’s interactions with the application. It contains business logic that describe the connections with your domain objects.

- [article](https://www.netguru.co/blog/service-objects-in-rails-will-help) about using services in rails.
- [video](http://railscasts.com/episodes/398-service-objects) Railscast - implementing a service.
- [video](https://vimeo.com/106759024) domain driven Rails

### *app/uploaders

A uploader is a class that is used by CarrierWave gem to model an uploaded file.

- [github](https://github.com/carrierwaveuploader/carrierwave) CarrierWave gem.
- [video](https://www.youtube.com/watch?v=YpF_4uciMvg) Railscast - file uploading with CarrierWave.

### *app/use_cases

Use Cases is pretty much the same thing as services. They are designed to break up non-trivial business logic.

- [article](https://webuild.envato.com/blog/a-case-for-use-cases/) details on _use cases_.
- [video](https://www.youtube.com/watch?v=atFN0rReJfA) on her article above.

### *app/values

Value objects are an abstraction where equality is based on internal fields instead of identity.

- [article](https://revs.runtime-revolution.com/value-objects-in-ruby-on-rails-9df64bc8db34) discussion and examples.

### app/views

Contains app [views](http://guides.rubyonrails.org/layouts_and_rendering.html).

### *app/workers

Workers are objects that allow you to run processes in the background. Remeber, it is recommended to use active job instead of your own workers so you can later switch out job runners without having to worry about api differences.

- [github](https://github.com/mperham/sidekiq) Sidekiq gem
- [github](https://github.com/resque/resque) Resque gem
- [article](https://ryanboland.com/blog/writing-your-first-background-worker/) writing workers.
- [video](https://www.youtube.com/watch?v=CStZg8ql9Vs) Sidekiq using active job.

---

### bin

Contains the rails script that starts your app and can contain other scripts you use to setup, update, deploy or run your application.

---

### config

Configure your application's routes, database, and more. This is covered in more detail in [Configuring Rails Applications](http://guides.rubyonrails.org/configuring.html).

---

### db

Contains your current database schema, as well as the database migrations.

---

### lib

Extended modules for your application.

---

### log

Application log files.

---

### public

The only folder seen by the world as-is. Contains static files and compiled assets.

---

### spec

Alternative to test directory using BDD. [Rspec](http://guides.rubyonrails.org/testing.html) allows you to write an alternative syntax to Test Unit that reads more like a specification than a test.

---

### tmp

Temporary files (like cache and pid files).

---

### vendor

A place for all third-party code. In a typical Rails application this includes vendored gems.

---

References:

- [jwipeout/rails-directory-structure-guide](https://github.com/jwipeout/rails-directory-structure-guide/blob/master/README.md)
