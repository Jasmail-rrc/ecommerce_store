ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :price
    column :stock_quantity
    actions
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :description
      f.input :price, input_html: { min: 0.01, step: 0.01 }
      f.input :stock_quantity
    end

    f.actions
  end
end