package security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SecurityConfig {

    public static final String ROLE_ADMIN = "ADMIN";
    public static final String ROLE_USER = "USER";

    private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();

    static {
        init();
    }

    private static void init() {
        List<String> urlPatternsUser = new ArrayList<String>();

        urlPatternsUser.add("/userInfo");

        mapConfig.put(ROLE_USER, urlPatternsUser);

        List<String> urlPatternsAdmin = new ArrayList<String>();

        urlPatternsAdmin.add("/userInfo");

        mapConfig.put(ROLE_ADMIN, urlPatternsAdmin);
    }

    public static Set<String> getAllAppRoles() {
        return mapConfig.keySet();
    }

    public static List<String> getUrlPatternsForRole(String role) {
        return mapConfig.get(role);
    }

}