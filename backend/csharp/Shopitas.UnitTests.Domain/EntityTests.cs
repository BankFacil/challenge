using Shopitas.Domain.Base;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class EntityTests
    {
        private class TestEntity : Entity
        {
            public TestEntity(int id)
            {
                Id = id;
            }
        }

        [Fact]
        public void Should_compare_entities_based_on_id()
        {
            var entity1 = new TestEntity(1);
            var entity2 = new TestEntity(2);
            var entity1WithOtherReference = new TestEntity(1);

            Assert.NotEqual(entity1, entity2);
            Assert.Equal(entity1, entity1WithOtherReference);
        }

        [Fact]
        public void Should_hash_code_be_computed_based_on_id()
        {
            var entity = new TestEntity(1);

            Assert.Equal(entity.Id.GetHashCode(), entity.GetHashCode());
        }
    }
}