package mainpackage;

public class Doctor extends Users{
    private String specialty;

    //Getters and Setters
    public String getSpecialty() {
        return specialty;
    }
    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    //Constructor
    public Doctor(String username, String name, String surname, String password, String userType, String specialty) {
        super(username, name, surname, password, userType);
        this.setSpecialty(specialty);
    }

    public void InsertAvailableAppointments(){
        System.out.println("Insert your available appointments: ");
    }
    public void MonthlyAppointments(){
        System.out.println("Your monthly appointments are: ");
    }
}