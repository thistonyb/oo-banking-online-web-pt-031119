class Transfer
  attr_accessor :amount, :receiver, :sender, :status

  def initialize(sender, receiver, amount)
    @amount = amount
    @receiver = receiver
    @sender = sender
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  # def execute_transaction
  #   if self.sender.balance < self.amount
  #     self.status = "rejected"
  #     "Transaction rejected. Please check your account balance."
  #   elsif self.status == "complete"
  #     "Transaction was already completed."
  #   else
  #     self.sender.balance -= self.amount
  #     self.receiver.deposit(self.amount)
  #     self.status = "complete"
  #   end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

  def execute_transaction
    if self.sender.status = "closed"
      "Transaction rejected. Please check your account balance."
    elsif
      self.status == "pending" && self.valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    end
  end

end
