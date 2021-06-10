class Aquarium 
  @@all = []
  def self.all 
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  # has_many
  def exhibits 
    Exhibit.all.select {|exhibit| exhibit.aquarium == self }
  end

  # has_many, through
  def fish 
    exhibits.map{|exhibit| exhibit.fish }.flatten
  end
end

class Exhibit 
  @@all = []
  def self.all 
    @@all
  end

  attr_reader :aquarium
  def initialize(name, aquarium)
    @name = name
    @aquarium = aquarium
    @@all << self
  end

  def fish 
    Fish.all.select {|fish| fish.exhibit == self }
  end

end


class Fish 
  @@all = []
  def self.all 
    @@all
  end

  attr_reader :exhibit
  def initialize(name, exhibit)
    @name = name
    @exhibit = exhibit
    @@all << self
  end
end

class Doctor 
  @@all = []

  def self.all
    @@all 
  end

  attr_reader :name
  def initialize(name)
    @name = name 
    @@all << self
  end

  def appointments # returns the appointments that belong to this doctor
    Appointment.all.select {|appointment| appointment.doctor == self}
  end

  def patients # returns an array of patients that this doctor has appointments with
    appointments.map {|appointment| appointment.patient }
  end
end

class Patient 
  @@all = []

  def self.all
    @@all 
  end

  attr_reader :name
  def initialize(name)
    @name = name 
    @@all << self
  end

  def appointments # returns the appointments that belong to this patient
    Appointment.all.select {|appointment| appointment.patient == self}
  end

  def doctors # returns an array of doctors that this patient has appointments with
    appointments.map {|appointment| appointment.doctor }
  end
end

class Appointment 
  @@all = []

  def self.all
    @@all 
  end

  attr_reader :doctor, :patient
  def initialize(time, doctor, patient)
    @time = time 
    @doctor = doctor
    @patient = patient
    @@all << self
  end

end