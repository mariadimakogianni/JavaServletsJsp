package mainpackage;
import java.io.File;
import java.io.IOException;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.*;
import java.io.FileInputStream;


public class CreateUsers {
    public static void main(String[] args) {
        Admin Fridy = new Admin("Fridy", "Dio", "Magos", "Koutsobolis", "Admin");
        String path;

        try {
            System.out.println("Are you a doctor or a patient?");
            Scanner s = new Scanner(System.in);
            String userType = s.nextLine();


            String d = "doctor";
            String p = "patient";

            if (userType.equals(p) ) {
                Scanner sc = new Scanner(System.in);
                System.out.println("Username: ");
                String username = sc.nextLine();
                System.out.println("Name: ");
                String name = sc.nextLine();
                System.out.println("Surname: ");
                String surname = sc.nextLine();
                System.out.println("Password: ");
                String password = sc.nextLine();
                System.out.println("Amka: ");
                String amka = sc.nextLine();

                System.out.println("Username:" + username);
                System.out.println("Name: " + name);
                System.out.println("Surname: " + surname);
                System.out.println("Password: " + password);
                System.out.println("Amka: " + amka);




            } else if (userType.equals(d))  {
                Scanner sc = new Scanner(System.in);
                System.out.println("Username: ");
                String username = sc.nextLine();
                System.out.println("Name: ");
                String name = sc.nextLine();
                System.out.println("Surname: ");
                String surname = sc.nextLine();
                System.out.println("Password: ");
                String password = sc.nextLine();
                System.out.println("Specialty: ");
                String specialty = sc.nextLine();

                System.out.println("Username:" + username);
                System.out.println("Name: " + name);
                System.out.println("Surname: " + surname);
                System.out.println("Password: " + password);
                System.out.println("Specialty: " + specialty);

                Doctor doc = new Doctor(username, name, surname, password, userType, specialty);
            }
            else
                System.out.println("you didnt put the right type");


        } catch (Exception e) {
            System.out.println("oops something went wrong");
        }


        path = "C:/Users/user/Desktop/programstodiad/JavaBasics/src/patientarxeio.txt";
        try {
            File myObj = new File(path);
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                String[] parts = data.split(" ");
                String username= parts[0];
                String name= parts[1];
                String surname= parts[2];
                String password= parts[3];
                String amka= parts[4];
                String userType = "patient";
                Patient asthen = new Patient(username, name, surname, password, userType, amka);
                System.out.println(asthen.getName());

            }

            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
