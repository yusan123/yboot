package pattern.singleton.enumsingleton;

/**
 * @author 田培融
 * @Date 2020/3/2 17:06
 * @EMail canghaihongxin@163.com
 **/
public enum EnumSingle {
    instance;

    public static EnumSingle getInstance() {
        return instance;
    }

    @Override
    public String toString() {
        return "hello world";
    }
}
