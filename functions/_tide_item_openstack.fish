function _tide_item_openstack
    # exit if no endpoint is set
    if test -z "$OS_AUTH_URL"
        return
    end

    # set up openstack api version
    if type -q curl; and type -q jq
        set OS_API_VERSION (curl -qs $OS_AUTH_URL 2>/dev/null |jq '.[].values[].id')
    end

    # setup  openstack info var
    if test -n "$OS_NAME"; and test -n "$OS_API_VERSION"
        set OS_INFO " (" $OS_NAME-$OS_API_VERSION ")"
    else
        set OS_INFO " (" $OS_NAME $OS_API_VERSION ")"
    end

    # print prompt
    if test -n "$OS_USERNAME"; and test -n "$OS_PROJECT_NAME"
        _tide_print_item openstack $tide_openstack_icon " " $OS_USERNAME@$OS_PROJECT_NAME $OS_INFO
    end
end
