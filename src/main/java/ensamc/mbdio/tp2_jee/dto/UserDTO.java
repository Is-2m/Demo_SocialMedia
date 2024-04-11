package ensamc.mbdio.tp2_jee.dto;

import ensamc.mbdio.tp2_jee.model.Friendship;
import ensamc.mbdio.tp2_jee.model.User;

public class UserDTO {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String birthDate;
    private String phone;
    private String gender;
    private String address;
    private String aboutMe;
    private String otherName;
    private String profilePicture;
    private String favoriteQuote;
    private Friendship friendship;

    public UserDTO() {
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

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getFavoriteQuote() {
        return favoriteQuote;
    }

    public void setFavoriteQuote(String favoriteQuote) {
        this.favoriteQuote = favoriteQuote;
    }

    public Friendship getFriendship() {
        return friendship;
    }

    public void setFriendship(Friendship friendship) {
        this.friendship = friendship;
    }

    public User toUser() {
        User user = new User();
        user.setId(id);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setBirthDate(birthDate);
        user.setPhone(phone);
        user.setAddress(address);
        user.setGender(gender);
        user.setAboutMe(aboutMe);
        user.setOtherName(otherName);
        user.setProfilePicture(profilePicture);
        user.setFavoriteQuote(favoriteQuote);
        return user;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", birthDate='" + birthDate + '\'' +
                ", phone='" + phone + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", aboutMe='" + aboutMe + '\'' +
                ", otherName='" + otherName + '\'' +
                ", profilePicture='" + profilePicture + '\'' +
                ", favoriteQuote='" + favoriteQuote + '\'' +
                ", friendship=" + friendship +
                '}';
    }
}
