package spl

class Blurb implements Serializable {

    String name
    String content

    static constraints = {

        name nullable:false
        content nullable:true, maxSize:100000

    }

}
