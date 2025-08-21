function _tide_item_openstack
    # set up openstack version var
    if test -n "$OS_AUTH_URL"; and test -z "$OS_VERSION"
        if type -q curl; and type -q jq
            set OS_VERSION "openstack " (curl -q $OS_AUTH_URL |jq '.[].values[].id[]')
        else
            set OS_VERSION "openstack"
        end
    end
    # it needs to be cleared somehow TODO

    if test -n "$OS_USERNAME"; and test -n "$OS_PROJECT_NAME"
        _tide_print_item openstack $tide_openstack_icon' ' "$OS_VERSION " "$OS_USERNAME@$OS_PROJECT_NAME"
    end
end
