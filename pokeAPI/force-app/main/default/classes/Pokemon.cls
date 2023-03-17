public class Pokemon {
    public Integer height;
    public Integer id; 
    public String name; 
    public Integer order; 
    public cls_sprites sprites;
    public cls_types[] types;
    public Integer weight; 
    public class cls_sprites {
      public String front_default; 
  
      public cls_other other;
    }
    class cls_back_female {
    }
    class cls_back_shiny_female {
    }
    class cls_front_female {
    }
    class cls_front_shiny_female {
    }
    public class cls_types {
      public Integer slot; //1
      public cls_type type;
    }
    public class cls_other {
      public cls_home home;
    }
    public class cls_home {
      public String front_default;
    }
    public class cls_type {
      public String name; 
      public String url;
    }
    public static Pokemon parse(String json) {
      return (Pokemon) System.JSON.deserialize(json, Pokemon.class);
    }
  }