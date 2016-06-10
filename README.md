gi# API for Healthy Buildings Web App
June 9, 2016 - Olivia Leach.

API for demo version of healthy buildings dashboard website. Tracks "healthy buildings" that belong to users, and allows for CRUD functionality between Users and their buildings.

Heroku: https://healthybuildings-api.herokuapp.com/

## Front End

Live website: http://olivia-leach.github.io/healthy-buildings-app/#/

Link to front end repo: https://github.com/olivia-leach/healthy-buildings-app

## Technologies Used

* Ruby on Rails
* PostgresSQL
* ActiveRecord

## ERD

![ERD](https://github.com/olivia-leach/healthy-buildings-api/blob/master/ERD.jpg)

## Models & Relationships

1. User
* Profile (belongs to User)
  * Holds info if user is an admin or not
* Building (belongs to User)
* Sensor (belongs to Building)
* Point (belongs to Sensor)
  * Individual data points from each sensor
* Measure (belongs to Building)
  * Baseline data from LEED certification
* Framework (has many measures)
  * Name, index weight etc. of baseline measurement
* Day (belongs to building)
  * Daily summary data for the 5 demo datas of data

## API Endpoints
| Verb   | URI Pattern            | Controller#Action    |
| ----   | -----------            | -----------------    |
| POST   | `/sign-up`             | `users#signup`       |
| POST   | `/sign-in`             | `users#signin`       |
| DELETE | `/sign-out/:id`        | `users#signout`      |
| PATCH  | `/change-password/:id` | `users#changepw`     |
| GET    | `/buildings`           | `buildings#index`    |
| GET    | `/buildings/:id`       | `buildings#show`     |
| DELETE | `/buildings/:id`       | `buildings#destroy`  |
| PATCH  | `/buildings/:id`       | `buildings#update`   |

All data returned from API actions is formatted as JSON.

## Authentication actions

The user authentication
 actions documentation and code were provided by [Antony Donovan](https://github.com/gaand) of General Assembly.

*Summary:*

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/sign-up`</td>
<td><strong>credentials</strong></td>
<td>201, Created</td>
<td><strong>user</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/sign-in`</td>
<td><strong>credentials</strong></td>
<td>200 OK</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/sign-out/:id`</td>
<td>empty</td>
<td>201 Created</td>
<td>empty</td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/change-password/:id`</td>
<td><strong>passwords</strong></td>
<td>204 No Content</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

### signup

The `create` action expects a *POST* of `credentials` identifying a new user to
 create, e.g. using `getFormFields`:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
  <input name="credentials[password_confirmation]" type="password" value="an example password">
</form>

```

or using `JSON`:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password",
    "password_confirmation": "an example password"
  }
}
```

The `password_confirmation` field is optional.

If the request is successful, the response will have an HTTP Status of 201,
 Created, and the body will be JSON containing the `id` and `email` of the new
 user, e.g.:

```json
{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be empty.

### signin

The `signin` action expects a *POST* with `credentials` identifying a previously
 registered user, e.g.:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
</form>
```

or:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password"
  }
}
```

If the request is successful, the response will have an HTTP Status of 200 OK,
 and the body will be JSON containing the user's `id`, `email`, and the `token`
 used to authenticate other requests, e.g.:

```json
{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "an example authentication token"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 401
 Unauthorized, and the response body will be empty.

### signout

The `signout` actions is a *DELETE* specifying the `id` of the user so sign out.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful, the response will have a status of 401
 Unauthorized.

### changepw

The `changepw` action expects a PATCH of `passwords` specifying the `old` and
 `new`.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful the reponse will have an HTTP status of 400 Bad
 Request.

---

The `sign-out` and `change-password` requests must include a valid HTTP header
 `Authorization: Token token=<token>` or they will be rejected with a status of
 401 Unauthorized.

## Application Actions

All requests must include a valid HTTP header `Authorization: Token
 token=<token>` or they will be rejected with a status of 401 Unauthorized.

All of the file actions, follow the *RESTful* style.

Files and folders (nodes) are associated with users through the _owner key that
is assigned at the time of document creation in the database.

### index

The `index` action is a *GET* that retrieves all the nodes (files/folders)
belonging to the currently signed in user.

The response body will contain JSON containing an array of nodes:

```json
{
  "nodes": [
    {
      "_id": "573c85e9f3b8e67c2292fcda",
      "updated_at": "2016-05-18T15:10:33.760Z",
      "created_at": "2016-05-18T15:10:33.760Z",
      "name": "strawberries",
      "path": ",home,fruit,",
      "_owner": "5738961e53fb07cc64327a7d",
      "type": "folder",
      "__v": "0",
      "tags": ["delicious", "tasty", "red"]
    },
    {
      "_id": "573c85f3f3b8e67c2292fcdb",
      "updated_at": "2016-05-18T15:10:43.508Z",
      "created_at": "2016-05-18T15:10:43.508Z",
      "location": "https://cuprous-wdi-11-boston.s3.amazonaws.com/2016-05-18/03eb8fdd10f79906ae5ed5da9657325a.png",
      "_owner": "5738961e53fb07cc64327a7d",
      "name": "tweed.png",
      "type": "file",
      "path": ",home,documents,pictures,fabrics,",
      "__v": "0",
      "tags": []
    },
  ]
}
```

If the user does not currently own any files or folders, an empty array of
nodes will be returned to them:

```json
{
  "nodes": []
}
```

### createFolder

The `createFolder` action expects a *POST* with a JSON body
If the request is successful, the response will have an HTTP Status of 201
Created, and the body will contain JSON of the created folder:

```json
{
  "node":
    {
      "name": "Mangosteen",
      "path": ",Home,User,Documents,Pictures,Fruit Pictures,"
    }
}
```

If the request is unsuccessful, the response will most likely produce a 500
internal server error since the server has not yet been configured to return a
more informative error status.

### createFile

The creatFile is almost exactly the same as the createFolder action, except that
it expects a body in the request that includes a file object.

### show

The `show` action is a *GET* request that is used to request all of the
immediate, i.e., first generation, children of the final node specified in the
id of the *GET* request. For instance, to obtain the contents of the documents
folder that is located at a hypothetical file path of /users/me/home/documents,
you would send a *GET* request to server/nodes/users,me,home,documents, and the
response would be an array of nodes

```json
{
  "nodes": [
    {
      "_id": "573c85e9f3b8e67c2292fcda",
      "updated_at": "2016-05-18T15:10:33.760Z",
      "created_at": "2016-05-18T15:10:33.760Z",
      "name": "strawberries",
      "path": ",users,me,home,documents,",
      "_owner": "5738961e53fb07cc64327a7d",
      "type": "folder",
      "__v": "0",
      "tags": ["delicious", "tasty", "red"]
    },
    {
      "_id": "573c85f3f3b8e67c2292fcdb",
      "updated_at": "2016-05-18T15:10:43.508Z",
      "created_at": "2016-05-18T15:10:43.508Z",
      "location": "https://cuprous-wdi-11-boston.s3.amazonaws.com/2016-05-18/03eb8fdd10f79906ae5ed5da9657325a.png",
      "_owner": "5738961e53fb07cc64327a7d",
      "name": "tweed.png",
      "type": "file",
      "path": ",users,me,home,documents,",
      "__v": "0",
      "tags": []
    },
  ]
}
```

If no node is found with the path that has been passed in the *GET* request,
an empty array of nodes will be returned:

```json
{
  "nodes": []
}
```

### update

This `update` action expects a JSON *PATCH* to the /nodes/:id path with a
single string associated with the tags field of a node. A properly formed
JSON *PATCH* request will look similar to the following example:

```json
{
    "node": {
        "tags": "sweet!"
    }
}
```

This will append the string, "sweet!" to the tags field of the node with the
id provided in the url of the *PATCH* request.

If the request is successful, the response will have an HTTP Status of 200 OK.

A request for an ID that is not found or that includes an invalid field in the
JSON request body found will result in a JSON response of

```json
{
  "error": {
    "message": "404 Not Found",
    "error": {
      "name": "HttpError",
      "status": 404,
      "message": "404 Not Found"
    }
  }
}
```

and a request that does not include a valid id will result in a JSON response
of

```json
{
  "error": {
    "message": "Cast to ObjectId failed for value \"573c98e5a3a2a905313c5a\" at path \"_id\"",
    "error": {
      "message": "Cast to ObjectId failed for value \"573c98e5a3a2a905313c5a\" at path \"_id\"",
      "name": "CastError",
      "kind": "ObjectId",
      "value": "573c98e5a3a2a905313c5a",
      "path": "_id"
    }
  }
}
```

### destroy

The destroy action expects a *DELETE* to the /nodes/:id path, where the id
corresponds to the _id of the node you wish to delete.

A request for an ID that is not found will result in a JSON response of

```json
{
  "error": {
    "message": "404 Not Found",
    "error": {
      "name": "HttpError",
      "status": 404,
      "message": "404 Not Found"
    }
  }
}
```

and a request that does not include a valid id will result in a JSON response
of

```json
{
  "error": {
    "message": "Cast to ObjectId failed for value \"573c98e5a3a2a905313c5a\" at path \"_id\"",
    "error": {
      "message": "Cast to ObjectId failed for value \"573c98e5a3a2a905313c5a\" at path \"_id\"",
      "name": "CastError",
      "kind": "ObjectId",
      "value": "573c98e5a3a2a905313c5a",
      "path": "_id"
    }
  }
}
