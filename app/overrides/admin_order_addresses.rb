Deface::Override.new(
    virtual_path: "spree/admin/shared/_address_form",
    name: "add_address_paste_to_admin_order_addresses",
    insert_top: '[data-hook="address_fields"]',
    partial: "spree/admin/shared/paste_address_form",
)
