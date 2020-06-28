package security;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class UserRoleRequestWrapper extends HttpServletRequestWrapper {
    private final int id;
    private final String user;
    private List<String> roles = null;
    private final HttpServletRequest realRequest;

    public UserRoleRequestWrapper(int id, String user, List<String> roles, HttpServletRequest request) {
        super(request);
        this.id = id;
        this.user = user;
        this.roles = roles;
        this.realRequest = request;
    }

    @Override
    public boolean isUserInRole(String role) {
        if (roles == null) {
            return this.realRequest.isUserInRole(role);
        }
        return roles.contains(role);
    }

    @Override
    public Principal getUserPrincipal() {
        if (this.user == null) {
            return realRequest.getUserPrincipal();
        }

        return new Principal() {
            @Override
            public String getName() {
                return user;
            }
        };
    }
}