class Aquarium 

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def exhibits # has_many
    Exhibit.all.select {|exhibit| exhibit.aquarium == self}
  end

  def fish # has_many through
    exhibits.map {|exhibit| exhibit.fish}.flatten
  end
end

class Exhibit

  @@all = []

  def self.all
    @@all
  end

  attr_reader :name, :aquarium
  def initialize(name, aquarium)
    @name = name
    @aquarium = aquarium
    @@all << self
  end

  def fish # has_many
    Fish.all.select {|fish| fish.exhibit == self}
  end
end

class Fish 
  @@all = []

  def self.all
    @@all
  end

  attr_accessor :name, :exhibit
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

  def initialize(name)
    @name = name
    @@all << self
  end

  def appointments # has_many 
    Appointment.all.select {|appointment| appointment.doctor == self}
  end

  def patients # has_many through
    appointments.map {|appointment| appointment.patient}.uniq
  end

end

class Patient 
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def appointments # has_many 
    Appointment.all.select {|appointment| appointment.patient == self}
  end

  def doctors # has_many through
    appointments.map {|appointment| appointment.doctor}
  end
end

class Appointment 
  @@all = []

  def self.all
    @@all
  end

  attr_accessor :doctor, :patient
  def initialize(time, doctor, patient)
    @time = time
    @doctor = doctor
    @patient = patient
    @@all << self
  end


end