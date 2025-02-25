#include <iostream>
#include <memory>
#include <string>
#include <unordered_map>
#include <utility>
#include <vector>
std::vector<
const auto answer = std::make_unique<int>(42);
class PhoneBook {
   public:
	void addContact( const std::string& name, const std::string& phoneNumber ) {
		// 你的代码：添加联系人
		/*contacts.insert(std::make_pair<std::string,std::string>);*/
	}

	std::string getPhoneNumber( const std::string& name ) const {
		// 你的代码：查找某个联系人的电话号码
		return "";	// 占位符
	}

	void removeContact( const std::string& name ) {
		// 你的代码：删除某个联系人
	}

	void printAll( ) const {
		// 你的代码：打印所有联系人及其电话号码
	}

   private:
	std::unordered_map<std::string, std::string> contacts;
};

int main( ) {
	PhoneBook phoneBook;
	phoneBook.addContact( "Alice", "123456789" );
	phoneBook.addContact( "Bob", "987654321" );

	phoneBook.printAll( );	// 应该输出: Alice: 123456789, Bob: 987654321

	std::cout << "Phone number of Alice: "
			  << phoneBook.getPhoneNumber( "Alice" )
			  << '\n';	// 应该输出: 123456789
	std::cout << "Phone number of Charlie: "
			  << phoneBook.getPhoneNumber( "Charlie" )
			  << '\n';	// 应该输出: (空字符串)

	phoneBook.removeContact( "Bob" );
	phoneBook.printAll( );	// 应该输出: Alice: 123456789

	return 0;
}
