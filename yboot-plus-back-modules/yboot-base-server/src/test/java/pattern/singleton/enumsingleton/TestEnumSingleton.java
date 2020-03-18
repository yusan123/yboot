package pattern.singleton.enumsingleton;

/**
 * @author 田培融
 * @Date 2020/3/2 17:08
 * @EMail canghaihongxin@163.com
 **/
public class TestEnumSingleton {
    public static void main(String[] args) {
        EnumSingle instance = EnumSingle.getInstance();
        System.out.println(instance.toString());
    }
}
