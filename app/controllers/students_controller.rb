class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  end

  def create
    @student = Student.create(first_name: params[:first_name], last_name: params[:last_name])
    @student.save
    redirect_to student_path(@student)
  end

end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new student" do
        expect{
          post :create, { :first_name => "Sam", :last_name => "Smith" }
        }.to change(Student,:count).by(1)
      end

      it "redirects to the new student" do
        post :create, { :first_name => "Sam", :last_name => "Smith" }
        expect(response).to redirect_to Student.last
      end
    end
  end

end
