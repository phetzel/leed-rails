class Api::ProjectsController < ApplicationController
    def index
        projects = Project.all
        projects.each do |project|
            project.photoUrl = url_for(project.image)
        end
        render json: projects
    end 

    def create
        project = Project.new(project_params)
        if project.save
            project.photoUrl = url_for(project.image)
            render json: project, except: :image
        else 
            render json: project.errors.full_messages, status: 422
        end
    end 

    def update 
        project = Project.find(params[:id])
        if project.update(project_params)
            project.photoUrl = url_for(project.image)
            render json: project
        else  
            render json: project.errors.full_messages, status: 422
        end
    end

    def destroy
        project = Project.find(params[:id])
        project.destroy
        projects = Project.all
        projects.each do |project|
            project.photoUrl = url_for(project.image)
        end
        render json: projects
    end

    private
    def project_params 
        params.require(:project).permit(
            :id,
            :name,
            :location,
            :services,
            :description,
            :image,
            :photoUrl
        )
    end 
end
