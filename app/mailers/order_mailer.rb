class OrderMailer < ApplicationMailer
  def new_order_email
    mail(to: "aviedik.mltykhian@mail.ru", subject: "Вы сделали заказ!")
  end
end
