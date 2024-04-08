import java.util.ArrayList;
import java.util.List;

import oop.Camel;
import oop.Cat;
import oop.Dog;
import oop.Hamster;
import oop.Horse;

public class Main {
    public static void main(String[] args){

        List<Cat> cats = new ArrayList<>();
        List <Dog> dogs = new ArrayList<>();
        List <Hamster> hamsters = new ArrayList<>();
        List <Camel> camels = new ArrayList<>();
        List <Horse> horses = new ArrayList<>();

        Cat cat1 = new Cat("cat","Barsik","2024-02-04","sit, eat, run, sleep");
        Cat cat2 = new Cat("cat","Musik","2022-09-24","sit, eat, sleep");
        Dog dog1 = new Dog("dog","Polcan","2016-05-07", "sit, eat, bark");
        Dog dog2 = new Dog("dog","Juchcka","2020-12-17", "stay, eat, sleep");
        Hamster hamster1 = new Hamster("hamster", "Homa","2023-08-12","eat, sleep");
        Camel camel1 = new Camel("camel","Fair", "2020-08-07","Walk, Carry Load");
        Horse horse1 = new Horse("horse", "Flash", "2018-01-01","Trot, Jump, Gallop");
        Horse horse2 = new Horse("horse", "Storm", "2018-01-01","Trot, Canter");


        cats.add(cat1);
        cats.add(cat2);
        dogs.add(dog1);
        dogs.add(dog2);
        hamsters.add(hamster1);
        camels.add(camel1);
        horses.add(horse1);
        horses.add(horse2);

        for(Cat item: cats){
            System.out.println(item.getType()+ ": name  " + item.getName() + ", birthday " + item.getAge() +
                    ", commands " + item.getCommand());
        }
        for(Dog item: dogs){
            System.out.println(item.getType()+ ": name  " + item.getName() + ", birthday " + item.getAge() +
                    ", commands " + item.getCommand());
        }
        for(Hamster item: hamsters){
            System.out.println(item.getType()+ ": name  " + item.getName() + ", birthday " + item.getAge() +
                    ", commands " + item.getCommand());
        }
        for(Camel item: camels){
            System.out.println(item.getType()+ ": name  " + item.getName() + ", birthday " + item.getAge() +
                    ", commands " + item.getCommand());
        }
        for(Horse item: horses){
            System.out.println(item.getType()+ ": name  " + item.getName() + ", birthday " + item.getAge() +
                    ", commands " + item.getCommand());
        }

    }
}