package oop;

import java.util.ArrayList;

public class Cat implements Pets {
    private String type;
    private String name;
    private String age;
    private String command;

    ArrayList<Cat> cats = new ArrayList<>();

    public Cat(String type, String name, String age, String command) {
        this.type = type;
        this.name = name;
        this.age = age;
        this.command = command;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    @Override
    public void makeSound() {

    }

    @Override
    public void getCare() {

    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCommand() {
        return command;
    }

    public void setCommand(String command) {
        this.command = command;
    }
}
