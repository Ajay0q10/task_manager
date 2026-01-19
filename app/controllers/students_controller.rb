class StudentsController < ApplicationController
 skip_before_action :verify_authenticity_token

    def index
        students = Student.all
        render json: students
    end



def hello
    render json: { message: "hello ruby"}
end

def about
    render json: { name: "ajay", age:23, address: "pune"}
end

def status
    render json: { active: true}
end

def greet
    name = params[:name]
    age = params[:age]
    address= params[:address]
    render json: {name: "hello #{name}", age: "ur age is #{age}", address:"and address is #{address}"}
end

def morning
    good= params[:good]
    night= params[:night]
    render json: {good: good, night:night}
end

# def create
#     student= Student.create(
#   name: params[:name],
#   age: params[:age],
#   address: params[:address]
# )

#     render json: {
#         message: "student saved successfully",
#         student:student
#     }
    
# end

# def create
#     student= Student.new(
#         name: params[:name],
#         age: params[:age],
#         address: params[:address]
#     )
#     if student.save
#         render json:{
#             message: "student saved sucessfully",
#             student: student
#         }

#     else
#         render json:{
#             message: "failed ro save student",
#             errors: student.errors.full_messages
#         }
#     end
# end

# def create
#     student=Student.new(student_params)

#     if student.save
#         render json:{
#             message: "student created sucessfully",
#             student: student
#     }
# else
#     render json:{
#         message: "not created",
#         errors:  student.errors.full_messages
#     }
# end
# end

# private

# def student_params
    # params.require(:student).permit(:name,:age,:address)
# end

  def sagar
    name = params[:name]
    age  = params[:age]

    render json: { name: name, age: age }
  end

#   def update
#     student = Student.find(params[:id])
#     if student.update(student_params)
#         render json: {
#             message: "student updated sucessfully",
#             student: student
#         }

#     else
#         render json: {
#             message:  "not updated sucessfully",
#             eerrors: student.errors.full_messages
#         }
#     end
# end

def update
    student = Student.find(params[:id])
    if student.update(student_params)
        render json: {
            message: "student updated sucessfully",
            student: student
        }
    else
        render json: {
            message: "not updated",
            errors: student.errors.full_messages
        }
    end
end

def destroy
    student = Student.find_by(id: params[:id])
    if student.destroy
    render json:{
        message: "student deleted suceddfully",
        student: student
    }
else
    render json:{
        message: " not deleted",
        errors: student.errors.full_messages
    }
end
end

# def destroy
#     student = Student.find(params[:id])
#     student.destroy
#     render json:{
#         message: " student deleted sucessfully"
#     }
# end

def create
    student = Student.new(student_params)
    if student.save
    render json: {
        message: "student saved sucessfully",
        student: student
    }
else
    render json: {
        message: "failed to save student",
        errors: student.errors.full_messages

    }
end 
end
    private
    def student_params
        params.require(:student).permit(:name,:age,:address)
    end

      


end
