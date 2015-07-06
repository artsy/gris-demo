require 'spec_helper'

describe PeopleEndpoint do
  include Rack::Test::Methods
  include_context 'with a running app and client'

  context 'people' do
    before(:each) do
      20.times do
        Fabricate(:person)
      end
    end

    it 'returns 10 people by default' do
      expect(client.people.count).to eq 10
    end

    it 'returns 2 people' do
      expect(client.people(size: 2).count).to eq 2
    end

    it 'returns pagination' do
      response = client.people(size: 2, page: 2)
      expect(response._links.next._url).to eq 'http://example.org/people?page=3&size=2'
      expect(response._links.prev._url).to eq 'http://example.org/people?page=1&size=2'
      expect(response._links.self._url).to eq 'http://example.org/people?page=2&size=2'
    end

    it 'returns all unique ids' do
      people = client.people
      expect(people.map(&:id).uniq.count).to eq 10
    end
  end

  context 'person' do
    let(:person_details) do
      {
        name: 'braque is not a talented artist'
      }
    end
    let(:person1) { Fabricate(:person, attributes: person_details) }

    it 'creates a person' do
      person = client.people._post(person: person_details)
      expect(person.name).to eq person_details[:name]
    end

    it 'returns a person' do
      person = client.person(id: person1.id)
      expect(person.id).to eq person1.id
      expect(person.name).to eq person_details[:name]
    end

    it 'updates a person' do
      person = client.person(id: person1.id)._patch(person: { name: 'braque is a talented artist' })
      expect(person.id).to eq person1.id
      expect(person.name).to eq 'braque is a talented artist'
    end

    it 'deletes a person' do
      person = client.person(id: person1.id)._delete
      expect(person.id).to eq person1.id
    end
  end
end
