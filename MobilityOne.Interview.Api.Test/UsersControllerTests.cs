using Microsoft.AspNetCore.Mvc;
using MobilityOne.Interview.Api.Controllers;
using MobilityOne.Interview.Api.Models;
using MobilityOne.Interview.Api.Repositories.Interfaces;
using MobilityOne.Interview.Api.Test.FakeRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using Xunit;

namespace MobilityOne.Interview.Api.Test
{
    public class UsersControllerTests
    {
        UsersController _controller;
        IUserRepository _repository;
        public UsersControllerTests()
        {
            _repository = new UserRepositoryFake();
            _controller = new UsersController(_repository);
        }

        [Fact]
        public void Get_WhenCalled_ReturnsOkResult()
        {
            // Act
            var okResult = _controller.Get();

            // Assert
            Assert.IsType<OkObjectResult>(okResult.Result);
        }

        [Fact]
        public void Get_WhenCalled_ReturnsAllItems()
        {
            // Act
            var okResult = _controller.Get().Result as OkObjectResult;

            // Assert
            var items = Assert.IsType<List<User>>(okResult.Value);
            Assert.Equal(3, items.Count);
        }

        [Fact]
        public void GetById_UnknownIdPassed_ReturnsNoContentResult()
        {
            // Act
            var notFoundResult = _controller.Get(-22);

            // Assert
            Assert.IsType<NotFoundObjectResult>(notFoundResult.Result);
        }

        [Fact]
        public void GetById_ExistingIdPassed_ReturnsOkResult()
        {
            // Arrange
            var existingId = 1;

            // Act
            var okResult = _controller.Get(existingId);

            // Assert
            Assert.IsType<OkObjectResult>(okResult.Result);
        }

        [Fact]
        public void GetById_ExistingIdPassed_ReturnsRightItem()
        {
            // Arrange
            var existingId = 1;

            // Act
            var okResult = _controller.Get(existingId).Result as OkObjectResult;

            // Assert
            Assert.IsType<User>(okResult.Value);
            Assert.Equal(existingId, (okResult.Value as User).Id);
        }

        [Fact]
        public void Add_ValidObject_OneItemMustAdded()
        {
            // Arrange
            var newUser = new User
            {
                Name = "Majid",
                PhoneNumber = "+989197558635",
                EmailAddress = "Majid@gmail.com",
                Password = "123456",
                Suspended = false,
                CreateDate = DateTime.Now,
                LastLogin = DateTime.Now
            };
            // Act
            _controller.Post(newUser);

            // Assert
            Assert.Equal(4, _repository.GetAll().Count());
        }

        [Fact]
        public void Edit_ValidObject_OneItemMustEdited()
        {
            // Arrange
            var user = new User
            {
                Id = 1,
                Name = "Hamed Moghadasi",
                PhoneNumber = "+989197558632",
                EmailAddress = "Hamed@gmail.com",
                Password = "123456",
                Suspended = false,
                CreateDate = DateTime.Now,
                LastLogin = DateTime.Now
            };

            // Act
            _controller.Put(user);

            // Assert
            var editedUser = _repository.GetById(1);
            Assert.Equal("Hamed Moghadasi", editedUser.Name);
        }



        [Fact]
        public void Remove_ExistingIdPassed_OneItemMustRemoved()
        {
            // Arrange
            var existingId = 1;
            // Act
            _controller.Delete(existingId);
            // Assert
            Assert.Equal(2, _repository.GetAll().Count());
        }
    }
}
