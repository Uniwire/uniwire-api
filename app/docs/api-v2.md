# API V2

To build our API, there are two main roads we could take:

* REST API

  That's the default choice, the one chosen for the API V1. Rails is prepared for it and it is straight forward to build one.

* GraphQL

  This is a powerful mechanism that the community has created to change how API's are built. Instead of making the API responsible to manage all possible variations a client can request, it leverages this responsibility to the client, making a flexible API.

However, to build a GraphQL API is not that simple and it breaks everything REST related: they declared war, so you have to choose your side. Or do you?

There is a third option, one that we are going to try in this API V2: [Graphiti](https://www.graphiti.dev/).

It was created to bring GraphQL's flexibility without drowning REST in the depths of the ocean. The middle way usually seems better because it can use the best part of both sides.

There are plenty of resources in the official website explaining how to build it on top of an existing API (there are also tutorials explaining what to do to start an API from scratch using Graphiti).

## Resources

Instead of using active record models in the controllers, Graphiti uses `resources`. Resources are models built on top of the regular AR models, working a little bit like the Serializers. They will map the attributes that will be returned in the response.

There is a `resources` folder inside `app` containing all the resources used by the API.

The easiest way to create a resource is by using the built-in generator:

```
bin/rails g graphiti:resource StudentResidence first_name:string last_name:string age:integer created_at:datetime updated_at:datetime
```

## URL

For the examples below, we are using `v2` instead of `v1` (which is the Graphiti's default).

If you build a resource for `student_residences`, you can check your endpoint visiting:

http://localhost:3000/api/v2/student_residences

There are some extra attributes in the response we are not used to if we always make REST APIs. If you want the traditional response, add `.json` at the end of the URL:

http://localhost:3000/api/v2/student_residences.json

## Sort, Filter, Paginate and more

You can change the response of the endpoints using the URL. Here is a few tricks:

* [Sort by name ascending](http://localhost:3000/api/v2/student_residences?sort=name)
* [Sort by first_name descending](http://localhost:3000/api/v2/student_residences?sort=-name)
* [Return only name, capacity and created_at in the response](http://localhost:3000/api/v2/student_residences?fields[student_residences]=name,capacity,created_at)
* [Case-insensitive filter on name](http://localhost:3000/api/v2/student_residences?filter[name]=jurupinga)
* [Case-sensitive filter on name](http://localhost:3000/api/v2/student_residences?filter[name][eql]=Jurupinga)
* [Filter with prefix](http://localhost:3000/api/v2/student_residences?filter[name][prefix]=j)
* [Filter with suffix](http://localhost:3000/api/v2/student_residences?filter[name][suffix]=j)
* [Filter that contains a term](http://localhost:3000/api/v2/student_residences?filter[name][match]=o)
* [Filter on exact capacity](http://localhost:3000/api/v2/student_residences?filter[capacity]=4)
* [Filter on `greated than` capacity](http://localhost:3000/api/v2/student_residences?filter[capacity][gt]=2)
* [Filter on `greated than or equal` capacity](http://localhost:3000/api/v2/student_residences?filter[capacity][gt2]=2)
* [Filter on `less than` capacity](http://localhost:3000/api/v2/student_residences?filter[capacity][lt]=2)
* [Filter on `less than or equal` capacity](http://localhost:3000/api/v2/student_residences?filter[capacity][lte]=2)
* [Paginate](http://localhost:3000/api/v2/student_residences?page[size]=3)
* [Paginate with offset](http://localhost:3000/api/v2/student_residences?page[size]=3&page[number]=2)
* [Mixing filter and sort](http://localhost:3000/api/v2/student_residences?filter[capacity][gte]=2&sort=capacity)

## Graphiti Rails

There is a guide explaining how to use Graphiti together with [graphiti-rails](https://github.com/graphiti-api/graphiti-rails):

https://www.graphiti.dev/guides/graphiti-rails-migration
