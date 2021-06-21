package mainpackage;

public class Users {
    private String username;
    private String password;
    private String name;
    private String surname;
    private String userType;
    public static int userCounter=0;

    // Getters and Setters
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getSurname() {
        return surname;
    }
    public void setSurname(String surname) {
        this.surname = surname;
    }
    public String getUserType() {
        return userType;
    }
    public void setUserType(String userType) {
        this.userType = userType;
    }

    //Constructor
    public Users(String username, String name,String surname,String password,String userType) {
        userCounter++;
        this.setName(name);
        this.setSurname(surname);
        this.setUsername(username);
        this.setPassword(password);
        this.setUserType(userType);

    }

    public void Login() {
        System.out.println(this.getUsername()+" has logged in.");

    }
    public void Logout() {
        System.out.println(this.getUsername()+" has logged out.");

    }
}

