package ensamc.mbdio.tp2_jee.model;


import java.util.List;

public class User {

    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String birthDate;
    private String phone;
    private String gender;
    private String address;
    private String aboutMe;
    private String otherName;
    private String favoriteQuote;
    private List<User> friends;
    private String profilePicture;


    public User(int id, String email, String password, String phone) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.phone = phone;
    }

    public User(String firstName, String lastName, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }

    public User(String firstName, String lastName, String email, String password, String birthDate, String phone, String gender, String address, String aboutMe, String otherName, String favoriteQuote) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.birthDate = birthDate;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.aboutMe = aboutMe;
        this.otherName = otherName;
        this.favoriteQuote = favoriteQuote;
    }

    public User(int id, String firstName, String lastName, String email, String password, String birthDate, String phone, String gender, String address, String aboutMe, String otherName, String favoriteQuote) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.birthDate = birthDate;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.aboutMe = aboutMe;
        this.otherName = otherName;
        this.favoriteQuote = favoriteQuote;
    }

    public User(int id, String firstName, String lastName, String email, String password, String birthDate,
                String phone, String gender, String address, String aboutMe, String otherName, String favoriteQuote,
                List<User> friends, String profilePicture) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.birthDate = birthDate;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.aboutMe = aboutMe;
        this.otherName = otherName;
        this.favoriteQuote = favoriteQuote;
        this.friends = friends;
        this.profilePicture = profilePicture;
    }

    public User(String firstName, String lastName, String email, String password, String birthDate,
                String phone, String gender, String address, String aboutMe, String otherName, String favoriteQuote,
                List<User> friends, String profilePicture) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.birthDate = birthDate;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.aboutMe = aboutMe;
        this.otherName = otherName;
        this.favoriteQuote = favoriteQuote;
        this.friends = friends;
        this.profilePicture = profilePicture;
    }

    public User(int id, String firstName, String lastName, String email, String password, String birthDate,
                String phone, String gender, String address, String aboutMe, String otherName, String favoriteQuote,
                String profilePicture) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.birthDate = birthDate;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.aboutMe = aboutMe;
        this.otherName = otherName;
        this.favoriteQuote = favoriteQuote;
        this.profilePicture = profilePicture;
    }

    public User(String firstName, String lastName, String email, String password, String birthDate,
                String phone, String gender, String address, String aboutMe, String otherName, String favoriteQuote,
                String profilePicture) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.birthDate = birthDate;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.aboutMe = aboutMe;
        this.otherName = otherName;
        this.favoriteQuote = favoriteQuote;
        this.profilePicture = profilePicture;
    }

    public User(String firstName, String lastName, String email, String password, String birthDate, String phone, String gender, String address, String aboutMe, String otherName, String favoriteQuote, List<User> friends) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.birthDate = birthDate;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.aboutMe = aboutMe;
        this.otherName = otherName;
        this.favoriteQuote = favoriteQuote;
    }

    public User(int id, String firstName, String lastName, String email, String password, String birthDate, String phone, String gender, String address, String aboutMe, String otherName, String favoriteQuote, List<User> friends) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.birthDate = birthDate;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.aboutMe = aboutMe;
        this.otherName = otherName;
        this.favoriteQuote = favoriteQuote;
        this.friends = friends;
    }

    public User() {
    }

    public List<User> getFriends() {
        return friends;
    }

    public void setFriends(List<User> friends) {
        this.friends = friends;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public String getOtherName() {
        return otherName;
    }

    public void setOtherName(String otherName) {
        this.otherName = otherName;
    }

    public String getFavoriteQuote() {
        return favoriteQuote;
    }

    public void setFavoriteQuote(String favoriteQuote) {
        this.favoriteQuote = favoriteQuote;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", birthDate='" + birthDate + '\'' +
                ", phone='" + phone + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", aboutMe='" + aboutMe + '\'' +
                ", otherName='" + otherName + '\'' +
                ", favoriteQuote='" + favoriteQuote + '\'' +
                ", friends=" + friends +
                ", profilePicture='" + profilePicture + '\'' +
                '}';
    }
}







